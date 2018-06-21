package com.shengrong.hibernate;

import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Productparam entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Productparam
 * @author MyEclipse Persistence Tools
 */
public class ProductparamDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ProductparamDAO.class);
	// property constants
	public static final String PARAMNAME = "paramname";
	public static final String PARAMVALUE = "paramvalue";

	public void save(Productparam transientInstance) {
		log.debug("saving Productparam instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Productparam persistentInstance) {
		log.debug("deleting Productparam instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Productparam findById(java.lang.Integer id) {
		log.debug("getting Productparam instance with id: " + id);
		try {
			Productparam instance = (Productparam) getSession().get(
					"com.shengrong.hibernate.Productparam", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Productparam instance) {
		log.debug("finding Productparam instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Productparam")
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
		log.debug("finding Productparam instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Productparam as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByParamname(Object paramname) {
		return findByProperty(PARAMNAME, paramname);
	}

	public List findByParamvalue(Object paramvalue) {
		return findByProperty(PARAMVALUE, paramvalue);
	}

	public List findAll() {
		log.debug("finding all Productparam instances");
		try {
			String queryString = "from Productparam";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Productparam merge(Productparam detachedInstance) {
		log.debug("merging Productparam instance");
		try {
			Productparam result = (Productparam) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Productparam instance) {
		log.debug("attaching dirty Productparam instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Productparam instance) {
		log.debug("attaching clean Productparam instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}