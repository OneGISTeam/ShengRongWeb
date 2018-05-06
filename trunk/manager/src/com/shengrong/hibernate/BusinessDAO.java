package com.shengrong.hibernate;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Business entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Business
 * @author MyEclipse Persistence Tools
 */
public class BusinessDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(BusinessDAO.class);
	// property constants
	public static final String DES = "des";
	public static final String ICON = "icon";
	public static final String BUSINESSNAME = "businessname";

	public void save(Business transientInstance) {
		log.debug("saving Business instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Business persistentInstance) {
		log.debug("deleting Business instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Business findById(java.lang.Integer id) {
		log.debug("getting Business instance with id: " + id);
		try {
			Business instance = (Business) getSession().get(
					"com.shengrong.hibernate.Business", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Business instance) {
		log.debug("finding Business instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Business")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Business instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Business as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDes(Object des) {
		return findByProperty(DES, des);
	}

	public List findByIcon(Object icon) {
		return findByProperty(ICON, icon);
	}

	public List findByBusinessname(Object businessname) {
		return findByProperty(BUSINESSNAME, businessname);
	}

	public List findAll() {
		log.debug("finding all Business instances");
		try {
			String queryString = "from Business";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Business merge(Business detachedInstance) {
		log.debug("merging Business instance");
		try {
			Business result = (Business) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Business instance) {
		log.debug("attaching dirty Business instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Business instance) {
		log.debug("attaching clean Business instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}