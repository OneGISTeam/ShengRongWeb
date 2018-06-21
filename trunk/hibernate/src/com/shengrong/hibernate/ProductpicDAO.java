package com.shengrong.hibernate;

import java.sql.Blob;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Productpic entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Productpic
 * @author MyEclipse Persistence Tools
 */
public class ProductpicDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ProductpicDAO.class);
	// property constants
	public static final String MAINPIC = "mainpic";

	public void save(Productpic transientInstance) {
		log.debug("saving Productpic instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Productpic persistentInstance) {
		log.debug("deleting Productpic instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Productpic findById(java.lang.Integer id) {
		log.debug("getting Productpic instance with id: " + id);
		try {
			Productpic instance = (Productpic) getSession().get(
					"com.shengrong.hibernate.Productpic", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Productpic instance) {
		log.debug("finding Productpic instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Productpic")
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
		log.debug("finding Productpic instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Productpic as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMainpic(Object mainpic) {
		return findByProperty(MAINPIC, mainpic);
	}

	public List findAll() {
		log.debug("finding all Productpic instances");
		try {
			String queryString = "from Productpic";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Productpic merge(Productpic detachedInstance) {
		log.debug("merging Productpic instance");
		try {
			Productpic result = (Productpic) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Productpic instance) {
		log.debug("attaching dirty Productpic instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Productpic instance) {
		log.debug("attaching clean Productpic instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}