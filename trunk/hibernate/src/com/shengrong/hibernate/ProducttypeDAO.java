package com.shengrong.hibernate;

import java.util.List;
import java.util.Set;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Producttype entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Producttype
 * @author MyEclipse Persistence Tools
 */
public class ProducttypeDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ProducttypeDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String DES = "des";

	public void save(Producttype transientInstance) {
		log.debug("saving Producttype instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Producttype persistentInstance) {
		log.debug("deleting Producttype instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Producttype findById(java.lang.Integer id) {
		log.debug("getting Producttype instance with id: " + id);
		try {
			Producttype instance = (Producttype) getSession().get(
					"com.shengrong.hibernate.Producttype", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Producttype instance) {
		log.debug("finding Producttype instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Producttype")
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
		log.debug("finding Producttype instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Producttype as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByDes(Object des) {
		return findByProperty(DES, des);
	}

	public List findAll() {
		log.debug("finding all Producttype instances");
		try {
			String queryString = "from Producttype";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Producttype merge(Producttype detachedInstance) {
		log.debug("merging Producttype instance");
		try {
			Producttype result = (Producttype) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Producttype instance) {
		log.debug("attaching dirty Producttype instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Producttype instance) {
		log.debug("attaching clean Producttype instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}